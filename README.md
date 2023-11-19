# vape
Un [azule](https://github.com/Al4ise/Azule) "clone" escrito en python3. `vape` tiene como objetivo ser más rápido, tener más características, tener un mejor soporte para dylibs modificados manualmente y, en general, tener menos problemas que azule. oficialmente es compatible con linux, macos y wsl. probado en arch linux y macos mojave w/ intel cpu.
## Características
~~no muchos ahora mismo, pero probablemente añadiré algunos en el futuro si los necesito. ~~

- Inyectar archivos deb, dylib, framework, bundle y appex y corregir automáticamente las dependencias cuando sea posible 
- Corrige automáticamente las dependencias de CydiaSubstrate, librocketbootstrap, libmryipc, libhdev y Cephei*
- Copiar cualquier tipo de archivo/carpeta desconocido a la raíz de la aplicación
- Utiliza un nivel de compresión personalizado
- Cambiar el nombre de la aplicación, la versión y el ID del paquete
- Añadir esquemas de url personalizados
- Cambiar el icono de la aplicación
- Habilitar el soporte de documentos
- Personalizar MinimumOSVersion
- Eliminar UISupportedDevices
- Eliminar la aplicación de reloj
- Eliminar las extensiones de la aplicación
- Firma falsa la salida ipa/app
- Usar derechos personalizados para la aplicación
- Fusionar un plist en el Info.plist existente de la aplicación
- Inyectar en @executable_path en lugar de @rpath
- Use un sustituto (código abierto) en lugar de CydiaSubstrate
- Comprimir usando 7zip en lugar de `zip`
## Uso
Puedes obtener información de uso con `vape -h`.

```
$ vape -h
usage: vape [-h] -i input -o output [-n name] [-v version] [-b bundle id] [-m minimum] [-c [level]] [-k icon] [-x entitlements] [-l plist] [-r url [url ...]] [-f files [files ...]] [-u] [-w] [-d] [-s] [-e] [-p] [-t] [-z]

Creador de iPAS para iPhone.

Opciones:
  -h, --help            Mostrar este mensaje de ayuda y salir
  -i input              El .ipa/.app para parchear
  -o output             El nombre del parche .ipa/.app que se creará
  -n name               Modificar el nombre de la aplicación
  -v version            Modificar la versión de la aplicación
  -b bundle id          Modificar el ID del paquete de la aplicación
  -m minimum            Cambiar MinimumOSVersion
  -c [level]            El nivel de compresión de la salida ipa (el valor predeterminado es 6)
  -k icon               Un archivo de imagen para usar como icono de la aplicación
  -x entitlements       Un archivo que contiene derechos para firmar la aplicación con
  -l plist              Un plist para fusionarse con el existente Info.plist
  -r url [url ...]      Esquemas de url para añadir
  -f files [files ...]  Ajustar archivos para inyectarlos en el ipa
  -u                    Eliminar UISupportedDevices
  -w                    Eliminar la aplicación Watch
  -d                    Habilitar el acceso a archivos
  -s                    Fakesigns el ipa (para usar con appsync)
  -e                    Eliminar extensiones de aplicaciones
  -p                    Inyectar en @executable_path
  -t                    Usar sustituto en lugar de sustrato
  -z                    Usa 7zip en lugar de zip
```

## instalacion

<details>
<summary><b>Instrucciones de macOS</b></summary>
<br/>
<ol>
  <li>Abre la terminal. Aquí es donde ejecutarás todos los comandos.</li>
  <li>Instalar <a href="https://apps.apple.com/us/app/xcode/id497799835">Xcode</a> De la tienda de aplicaciones (Si aún no está instalado)</li>
  <li>Instale las herramientas de Xcode cli (si aún no está instalada) <strong>O si <code>vape</code> De repente dejó de funcionar</strong>) Corriendo:
  <ul>
    <li><code>xcode-select --install</code></li>
    <li><code>sudo xcodebuild -license</code></li>
  </ul>
  </li>
  <li>
  instalar <code>insert_dylib</code>:

  <pre lang="bash"><code>git clone https://github.com/tyilo/insert_dylib.git && cd insert_dylib/insert_dylib && gcc main.c && chmod +x a.out && sudo mv a.out /usr/local/bin/insert_dylib && cd ../.. && sudo rm -r insert_dylib</code></pre>
  </li>
  <li>
  ejecutar <code>uname -m</code>. Si la salida dice <code>x86_64</code>, Ejecuta lo siguiente:
  
  <pre lang="bash"><code>sudo curl https://github.com/ProcursusTeam/ldid/releases/download/v2.1.5-procursus7/ldid_macosx_x86_64 --output /usr/local/bin/ldid && sudo chmod +x /usr/local/bin/ldid</code></pre>

  Si dice algo más, corre:

  <pre lang="bash"><code>sudo curl https://github.com/ProcursusTeam/ldid/releases/download/v2.1.5-procursus7/ldid_macosx_arm64 --output /usr/local/bin/ldid && sudo chmod +x /usr/local/bin/ldid</code></pre>
  </li>
  <li>
  instalar <code>vape</code>:

  <pre lang="bash"><code>bash -c "$(curl https://raw.githubusercontent.com/Jowandy17/iPA-ios2/main/install-vape.sh)"</code></pre>
  </li>
</ol>
</details>
