---
layout: post
title: "¿Cómo publicar en CRySoL?"
author: david.villa
description: ""
category: receta
tags: []
---
{% include JB/setup %}

Esta receta explica cómo crear posts en tu propio blog de CRySoL o
colaborar con el mantenimiento del sitio.

<!--more-->

La web de CRySoL es estática. Se genera a partir de un conjunto de
ficheros markdown y textile y se compila a HTML/CCS usando el programa
jekyll.

Los fuentes del sitio se encuentran en un repositorio git alojado en
github. Cuando se hace push a dicho repositorio, github ejecuta jekyll
automáticamente y deja el resultado accesible en
http://crysol.github.io.

Para crear un nuevo post basta crear un fichero en el directorio
/_posts cuyo nombre tenga el formato YEAR-MONTH-DAY-title.format,
siendo 'format' el lenguaje en el que está escrito markdown, textile
o HTML.

Estos ficheros tienen un encabezado que incluye información con el
título, autor, categorías, etiquetas, etc. Pueden encontrar más
detalle en FIXME, o simplemente mira el fuente de otro post existente.

A pesar de eso, cualquiera puede escribir en la web de CRySoL. Existen
dos formas básicas de editar tu blog en esta web.


Forma fácil
-----------

github tiene un sencillo editor web, de modo que podrás escribir tus
post directamente en el navegador. Ve a
https://github.com/CRySoL/CRySoL.github.io/tree/master/_posts y pulsa
el iconito de una página con un +. Eso creará un nuevo fichero que
puedes nombrar, editar y almacenar en el repositorio. Si está
convenientemente formateado a los pocos minutos aparecerá en la página
web.

Forma potente
-------------

El editor de github es muy simple, quizá demasiado. Si quieres editar
tu post con un editor de verdad (como emacs) y probar que el resultado
es el que esperas puedes hacer algo más interesante.

Clona el repositorio a tu computador:

$ git clone https://github.com/CRySoL/CRySoL.github.io.git

Instala jekyll y sus dependencias:

$ sudo gem install jekyll

Arranca jekyll:

CRySoL.github.io.git$ jekyll serve -w

Y puedes ver el sitio generado en http://localhost:4000. Gracias al
argumento -w el contenido se compila automáticamente con cualquier
cambio.

Edita tu post (u otro contenido) y cuando todo esté correcto envía tus
modificaciones a github.

CRySoL.github.io.git$ git commit -a
CRySoL.github.io.git$ git push


Colaboraciones ajenas
---------------------

Todo lo anterior solo funciona si tu cuenta de github pertenece al equipo de CRySoL.

Pero aunque no seas miembro del equipo aún puedes colaborar con CRySoL
gracias a la forma en que funciona git. Sigue estos pasos:

- Crea una cuenta en github y haz login
- Ve a https://github.com/CRySoL/CRySoL.github.io
- Pulsa el botón "Fork"

Ahora tienes una copia del repo de CRySoL en tu cuenta. A partir de
ahí puedes aplicar todo lo explicado anteriormente sobre tu clon del
repo. Cuando esté listo debes solicitar a los administradores del repo
original que integren tus cambios en el repo. Para eso simplemente
pulsa el botón "Pull Request" y espera a que un editor valide tus
aportaciones.
