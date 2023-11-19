# pyzule
an [azule](https://github.com/Al4ise/Azule) "clone" written in python3. `pyzule` aims to be faster, have more features, have better support for manually modified dylibs, and overall have less issues than azule. officially supports linux, macos, and wsl. tested on arch linux and macos mojave w/ intel cpu.

## features
~~not many right now, but will probably add some in the future if i need them.~~

open an issue for any feature requests!

- inject deb, dylib, framework, bundle, and appex files and automatically fix dependencies when possible
- automatically fix dependencies on CydiaSubstrate, librocketbootstrap, libmryipc, libhdev, and Cephei*
- copy any unknown file/folder types to app root
- use a custom compression level
- change app name, version, and bundle id
- add custom url schemes
- change app icon
- enable documents support
- customize MinimumOSVersion
- remove UISupportedDevices
- remove watch app
- remove app extensions
- fakesign the output ipa/app
- use custom entitlements for the app
- merge a plist into the app's existing Info.plist
- inject into @executable_path instead of @rpath
- use substitute (open source) instead of CydiaSubstrate
- compress using 7zip instead of `zip`

## usage
you can get usage info with `pyzule -h`.

```
$ pyzule -h
usage: pyzule [-h] -i input -o output [-n name] [-v version] [-b bundle id] [-m minimum] [-c [level]] [-k icon] [-x entitlements] [-l plist] [-r url [url ...]] [-f files [files ...]] [-u] [-w] [-d] [-s] [-e] [-p] [-t] [-z]

an azule "clone" written in python3.

options:
  -h, --help            show this help message and exit
  -i input              the .ipa/.app to patch
  -o output             the name of the patched .ipa/.app that will be created
  -n name               modify the app's name
  -v version            modify the app's version
  -b bundle id          modify the app's bundle id
  -m minimum            change MinimumOSVersion
  -c [level]            the compression level of the output ipa (default is 6)
  -k icon               an image file to use as the app icon
  -x entitlements       a file containing entitlements to sign the app with
  -l plist              a plist to merge with the existing Info.plist
  -r url [url ...]      url schemes to add
  -f files [files ...]  tweak files to inject into the ipa
  -u                    remove UISupportedDevices
  -w                    remove watch app
  -d                    enable files access
  -s                    fakesigns the ipa (for use with appsync)
  -e                    remove app extensions
  -p                    inject into @executable_path
  -t                    use substitute instead of substrate
  -z                    use 7zip instead of zip
```

## installation

<details>
<summary><b>macOS instructions</b></summary>
<br/>
<ol>
  <li>open Terminal. this is where you'll be running every command.</li>
  <li>install <a href="https://apps.apple.com/us/app/xcode/id497799835">Xcode</a> from the app store (if not already installed)</li>
  <li>Install the Xcode cli tools (if not already installed <strong>or if <code>pyzule</code> suddenly stopped working</strong>) by running:
  <ul>
    <li><code>xcode-select --install</code></li>
    <li><code>sudo xcodebuild -license</code></li>
  </ul>
  </li>
  <li>
  install <code>insert_dylib</code>:

  <pre lang="bash"><code>git clone https://github.com/tyilo/insert_dylib.git && cd insert_dylib/insert_dylib && gcc main.c && chmod +x a.out && sudo mv a.out /usr/local/bin/insert_dylib && cd ../.. && sudo rm -r insert_dylib</code></pre>
  </li>
  <li>
  run <code>uname -m</code>. if the output says <code>x86_64</code>, run the following:
  
  <pre lang="bash"><code>sudo curl https://github.com/ProcursusTeam/ldid/releases/download/v2.1.5-procursus7/ldid_macosx_x86_64 --output /usr/local/bin/ldid && sudo chmod +x /usr/local/bin/ldid</code></pre>

  if it says something else, run:

  <pre lang="bash"><code>sudo curl https://github.com/ProcursusTeam/ldid/releases/download/v2.1.5-procursus7/ldid_macosx_arm64 --output /usr/local/bin/ldid && sudo chmod +x /usr/local/bin/ldid</code></pre>
  </li>
  <li>
  install <code>pyzule</code>:

  <pre lang="bash"><code>bash -c "$(curl https://raw.githubusercontent.com/asdfzxcvbn/pyzule/main/install-pyzule.sh)"</code></pre>
  </li>
</ol>
</details>
