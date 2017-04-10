# Dave's Lamp Environment
This is just a little Docker image to create a LAMP environment (which I use for development purposes).

To build the image, simply run the `build.sh` script located in this directory.

Once the image is built, you can create a web app, and start a container by using the following command (replace **PATH\_TO\_YOUR\_APP** with the directory where you placed your app):

docker run -d -P -v **PATH\_TO\_YOUR\_APP**:/var/app daves-lamp-environment

Your app should contain a `webroot/` subdirectory which will serve as the document root.

You can create a `scripts/` directory inside your app, which can contain up to two scripts:

  - install.sh (called when your app is first installed)
  - update.sh (called every time your container is started)

The scripts are run after MySQL starts but before Apache starts, so you can use them to configure your database users as well as any special Apache configurations you may need.

Have fun!

-- Dave Hensley
