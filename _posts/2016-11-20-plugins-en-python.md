---
layout: post
title: "Plugins en Python"
author: magmax
category: recipe
tags: python
lang: es
---

Siempre me ha gustado escribir aplicaciones extensibles, pero picarme todo un sistema de plugins me ha parecido tedioso.

Por eso he intentado buscar librerías que me ayuden a crear plugins, aunque siempre he tenido problemas para la distribución de éstos, como [me ha pasado con Yapsy](http://magmax.org/blog/yapsy-un-sistema-de-plugins-pythonico).

La verdad es que me he sentido como un auténtico estúpido al descubrir que Python tiene un sistema para escribir plugins muy sencillo de usar. Vamos a ver cómo.

**Puedes encontrar el artículo original en: [MagMax Blog](<http://magmax.org/blog/plugins-en-python/>)**.

<!--break-->

Qué voy a hacer
---------------

Básicamente, vamos a hacer una pequeña aplicación y dos plugins.
Dependiendo de una opción se usará uno u otro.

Estructura:

```
.
├── app
│   └── app.py
├── plugin1
│   ├── plugin1
│   │   └── __init__.py
│   └── setup.py
└── plugin2
    ├── plugin2
    │   └── __init__.py
    └── setup.py
```

Plugin 1
--------

Vamos a comenzar escribiendo un plugin. Va a ser algo muy sencillo. Para
ello, creamos dos ficheros; el primero será el plugin propiamente dicho,
en el fichero `plugin1/plugin1/__init__.py`:

{% highlight python %}
def example():
   print("I'm plugin one")
{% endhighlight %}


Y aquí está el truco: en el archivo `plugin1/setup.py`:

{% highlight python %}
from setuptools import setup, find_packages

setup(
    name='plugin1',
    version='0.0.6',
    description="This is the plugin 1",
    packages=find_packages('.'),
    entry_points={
        'plugin_system': 'example = plugin1:example'
    },
)
{% endhighlight %}

Lo he reducido al mínimo. La parte importante es la de `entry_points`,
ya que estoy definiendo un *entry point* llamado `plugin_system` que,
básicamente, asigna a una variable la función anterior.

Con esto ya tenemos el plugin. Vamos a compilarlo (para ahorrar
problemas, lo compilaremos como `source`):

<div class="console">
{% highlight console %}
$ python setup.py sdist
{% endhighlight %}
</div>

lo que generará el archivo `dist/plugin1-0.0.6.tar.gz`. La versión 0.0.6
es porque 0.0.1 era muy sosa XD

Aplicación
----------

Vamos ahora con la aplicación principal (`app/app.py`):

{% highlight python %}
import argparse
import pkg_resources

def main():
    parser = argparse.ArgumentParser(description='Loads a plugin')
    parser.add_argument('action', choices=['run', 'list'],
                        help='action to be performed')
    parser.add_argument('-p', '--plugin',
                        help='plugin to be loaded')
    args = parser.parse_args()

    if args.action == 'list':
        full_env = pkg_resources.Environment()
        dists, errors = pkg_resources.WorkingSet().find_plugins(full_env)
        for dist in dists:
            if 'plugin_system' in dist.get_entry_map():
                print('  %s (%s)' % (dist.project_name, dist.version))
    elif args.action == 'run':
        requirement = pkg_resources.Requirement(args.plugin)
        plugin = pkg_resources.WorkingSet().find(requirement)
        example = plugin.load_entry_point('plugin_system', 'example')
        example()

if __name__ == '__main__':
    main()
{% endhighlight %}


Como se puede observar, hago uso intensivo de `pkg_resources`. Podemos
probar a listar los plugins instalados:

<div class="console">
{% highlight console %}
$ python app/app.py list
$
{% endhighlight %}
</div>

Y no tendremos nada. Claro, falta instalar el plugin. Para ello,
simplemente usamos `pip`, pero me voy a crear un `virtualenv` para no
engorrinarme el sistema:

<div class="console">
{% highlight console %}
$ virtualenv venv
[...]
$ . venv/bin/activate
(venv) $ pip install plugin1/dist/plugin1-0.0.6.tar.gz
[...]
(venv) $ python app.py list
  plugin1 (0.0.6)
(venv) $
{% endhighlight %}
</div>


Mucho mejor. Ahora vamos a ejecutarlo:

<div class="console">
{% highlight console %}
(venv) $ python app.py run -p plugin1
I'm plugin one
(venv) $
{% endhighlight %}
</div>



Plugin2
-------

El lector avispado no tendrá problema en crearlo a partir del plugin1 :)
Es más, podéis crear todos los que queráis XD


Notas
-----

La gracia es que podemos tener más de un `entrypoint`, o agruparlos por
clave.

Con esto ya no necesito [Yapsy](http://yapsy.sourceforge.net/) ni
[PluginBase](http://pluginbase.pocoo.org/) ni ningún otro sistema
enrevesado.

Para más información, podéis leer [Dynamic Discovery of Services and
Plugins](http://setuptools.readthedocs.io/en/latest/setuptools.html#dynamic-discovery-of-services-and-plugins).
