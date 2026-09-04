# WildFly Booklet App

Prototype. Factory-generated Booklet app from wildfly-builder.

Catalog: https://sw-builder.com/appstore/wildfly/apps/wildfly-booklet-app.html

Builder: https://github.com/Gator-Go/wildfly-builder

Live demo: https://sw-builder.com/booklet/do?op=Home  
Sign in with `guest` / `guest`.

## Build (Unix)

Prerequisites: Git, Groovy, JDK, Maven, WildFly.

Expected sibling directories:

    ~/wildfly/wildfly-builder
    ~/wildfly/wildfly-booklet-app

```bash
cd ~/wildfly/wildfly-booklet-app
git pull
./wildfly-booklet-build-deploy.sh
```
## Layout
```text
wildfly-booklet-app/
├── wildfly-booklet-build-deploy.sh
├── Extender/
│   └── BookletExtender.groovy
├── options/                      # app-specific metadata
│   ├── APP_CODE_TYPES.xml
│   ├── APP_ENUMS.xml
│   ├── APP_EVENTS.xml
│   ├── APP_HOME.xml
│   ├── APP_NAMES.xml
│   └── APP_TABLES.xml
├── booklet.jpg
├── booklet_logo.png
├── cert.jpg
├── SimpleBooklet.jrxml
└── certTest.jrxml
```
## Sample images:
Copy the background JPGs onto the WildFly host:
booklet.jpg  ->  /opt/wildfly/background/booklet.jpg
cert.jpg     ->  /opt/wildfly/background/cert.jpg

## Reports:
SimpleBooklet.jrxml and certTest.jrxml are Jasper report templates.
Load them in the running app with an admin account.

## Note:
The template/ and build/ dirs appear after a build. They come from
wildfly-builder.

WildflyBuilder.groovy is copied in from droid-builder at build time.

BookletExtender.groovy performs functions unique to the booklet app such as deploying 
the booklet logo image.

The booklet/ dir appear after a build and is the build output and where
the new app is created.



