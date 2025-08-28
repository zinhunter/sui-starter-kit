# Introducción

## Módulos y Paquetes

**Move** en Sui tiene dos tipos diferentes de programas: Módulos y Paquetes. 

Move es un lenguaje para escribir contratos inteligentes, programas que se almacenan y ejecutan en la blockchain. Un programa se organiza en un paquete. Un paquete se publica en la blockchain y se identifica mediante una dirección. Se puede interactuar con un paquete publicado enviando transacciones que llamen a sus funciones. También puede actuar como dependencia de otros paquetes.

Un módulo es la unidad base de organización del código en Move. Los módulos se utilizan para agrupar y aislar código, y todos los miembros del módulo son privados para el módulo por defecto.

En esta sección aprenderás cómo definir un módulo, declarar sus miembros y acceder a él desde otros módulos.

Módulo:
* Contiene funciones y tipos.

Paquete:
* Conjunto de módulos.

En los siguientes tutoriales trabajaremos la mayor parte del tiempo **sólo con módulos**.

## Ejecutando el tutorial

> :information_source: Recuerda que debes navegar en tu terminal a este directorio:
>```sh
>cd backend/00_intro
>```

Ingresa a tu terminal y ejecuta el siguiente comando:

```sh
sui move test
```

Deberías de obtener el siguiente resultado:
```sh
INCLUDING DEPENDENCY Bridge
INCLUDING DEPENDENCY SuiSystem
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING Intro
Running Move unit tests
[debug] "Hello, World!"
[ PASS    ] introduccion::practica_sui::prueba
Test result: OK. Total tests: 1; passed: 1; failed: 0
```

¡Felicidades! :partying_face: Acabas de ejecutar de manera exitosa tu primer módulo Move. Ahora, analicemos que está pasando.

En la carpeta `sources` podemos encontrar un archivo llamado `introduccion.move`. Este archivo, como lo indica la extensión, contiene el código de Move que estamos ejecutando. En este caso, es un **módulo** con una **función** y un **test**.

## Estructura de un módulo

La estructura de un **módulo** es la siguiente:

```rust
module direccion::nombre_modulo {
    // ...  resto del código
}
```

1. Declaración del módulo con la palabra clave `module`.
2. Dirección en la que se desplegará el módulo.
    La dirección la encontramos en el archivo de configuraciones `Move.toml`, en el apartado de `addresses`. En nuestro caso:
    ```toml
    [addresses]
    introduccion = "0x5A6F6E612054726573"
    ```
3. Nombre del módulo, en nuestro caso: `practica_sui`

Por lo que nuestro código luce así:
```rust
module introduccion::practica_sui {
    // ...  resto del código
}
```

Después, vienen los `imports` o los módulos/librerías que estamos importando para que el nuestro funcione. En nuestro código, estamos importando dos funciones de la librería principal de **Sui**:

```rust
    use std::debug::print;
    use std::string::utf8;
```

Se importa la función para imprimir en consola, así como una función para convertir cadenas de texto a un formato aceptado por la función anterior. Esto lo veremos más adelante en esta serie de tutoriales.

La siguiente sección de código incluye nuestra primera función:

```rust
    fun practica() {
        print(&utf8(b"Hello, World!"));
    }
```

En ella, hacemos uso de ambas librerías importadas. La función simplemente imprime la cadena `Hello, World!` en la consola.

Y por último, necesitamos una forma de ejecutar esta función. Por ahora lo estamos haciendo a través de un **bloque de pruebas** o `test`:

```rust
    #[test]
    fun prueba() {
        practica();
    }
```

Al nosotros haber ejecutado `sui move test` le estamos diciendo a la CLI que ejecute todas las funciones que tengan un bloque `[#test]`, en este caso, ejecuta nuestra función `prueba`, la cual a su vez llama a la función `practica`.

## Output

Por último, analicemos el resultado que se imprimió en la consola.

```sh
INCLUDING DEPENDENCY Bridge
INCLUDING DEPENDENCY SuiSystem
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING Intro
Running Move unit tests
[debug] "Hello, World!"
[ PASS    ] introduccion::practica_sui::prueba
Test result: OK. Total tests: 1; passed: 1; failed: 0
```

El primer bloque de texto nos indica que está incluyendo las dependencias necesarias para ejecutar el proyecto:

```sh
INCLUDING DEPENDENCY Bridge
INCLUDING DEPENDENCY SuiSystem
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING Intro
```

Estas dependencias son las dependencias básicas que todo paquete en **Move** necesita, así que el compilador las importa de manera automática.
Puedes comprobar que no estamos importando ninguna dependencia en el archivo `Move.toml` en el apartado `[dependencies]`.

La siguiente línea en el output nos indica que se ejecutaran las pruebas unitarias en el archivo, recuerda que esto es porque corrimos el comando `sui move test`:
```
Running Move unit tests
```

Después, obtenemos el mensaje que ejecuta la función prueba, en nuestro caso, la línea de texto `Hello, World!`:
```sh
[debug] "Hello, World!"
```

Ahora, en la siguiente línea, podemos obtener información de exactamente que funciones se ejecutaron:
```sh
[ PASS    ] introduccion::practica_sui::prueba
```
La estructura es algo así:
```rust
direccion::nombre_modulo::funcion
```
Con esto, podemos comprobar que la función que se ejecutó fue `prueba`.

Por último, obtenemos información sobre las pruebas unitarias, cómo cuantas se ejecutaron y cuantas se pasaron:

```sh
Test result: OK. Total tests: 1; passed: 1; failed: 0
```

## Reto final

Cómo reto final, modifica la función para que, en vez de mostrar `Hello, World!`, imprima el logo de **Sui** en arte ASCII:
```ASCII
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
================================================:..:================================================
===============================================......-==============================================
=============================================-..    ..:=============================================
============================================....    ....============================================
==========================================-..............:==========================================
=========================================.......:==:.......=========================================
=======================================-.......-====-.......:=======================================
======================================:.    .:========:.    ..-=====================================
====================================-.......:==========-.......:====================================
===================================.........=============:... ...===================================
=================================-.........================..   ..:=================================
================================....    ..:=================:.......================================
==============================-.....    ..:==================-.......:==============================
=============================:............:====================:.......=============================
===========================-.......-.......=====================-.......-===========================
==========================-.......==:......-======================:.... .-==========================
=========================-......:====.......-======================-......-=========================
=========================......:=====-.......:======================-......=========================
========================:......=======-... ....:=====================:.....:========================
========================......-=========.........:-===================......========================
=======================-    ..===========-..........:-================:.    :=======================
=======================:    .:=============-...........:==============-.    :=======================
=======================:    .:================:.....    ..-===========-.    .=======================
=======================:    .:==================-:..    ...:==========:.    :=======================
=======================-.  ...=====================-:...    .:========..    :=======================
========================......-=======================:.    ...=======..    -=======================
========================:.. ...=========================........=====.......========================
=========================......:=========================:......:===:......-========================
=========================-......:=========================.......-=:......:=========================
==========================:.    ..-=======================-.    ....    .:==========================
===========================:.......:=======================.    ........:===========================
============================-...    ..=====================:        ...-============================
==============================:.    ....:-================-.        ..==============================
================================:...    .....::------::.....    ....================================
==================================:.    ....................    .:-=================================
====================================-:........................:-====================================
========================================-:................:-========================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
```

> :information_source: Recuerda guardar tus cambios en el archivo para posteriormente hacerles `push` a tu repositorio de **Github**.