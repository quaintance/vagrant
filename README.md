

#Sample [Vagrant](https://http://www.vagrantup.com//) configuration files.


----------

### What You need
* [Oracle VirtualBox](https://https://www.virtualbox.org/)
  * As of 08/15/14, VirtualBox 4.3.12 is the latest stable release which works on a standard Staples build. later releases cause a problem with SEP.
  * Compatible with Windows 7, OS/X and Linux.
  * Requires enabling VT/x hardware virtualization in your workstation bios if not already enabled. (F10 at boot screen on most HP laptops).

* An SSH client if using Windows.
  * You can use [Cygwin](http://https://www.cygwin.com/) or [PuTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/) for this purpose.
  * If using PuTTY:
      * convert the ```%USERPROFILE%\.vagrant.d\insecure_private_key``` to .ppk using PuTTYGen
      * use the .ppk key in your PuTTY session - configured in Connection > SSH > Auth > Private key file
      * use port 2222 instead of 22
      * you can set the default username (vagrant) under Connection > SSH > Auth > Private key for authentication

* Finally, you need to install [Vagrant](https://www.vagrantup.com/downloads.html)


---
### Using the sample configurations
* The first step is to use git to clone the [Vagrant repository](http://handlebar.staples.com:7990/projects/STAP/repos/vagrant/browse) to your local machine.
* cd into the repository
* If using Vagrant for the first time:
  <pre>
  vagrant init vagrant-puppet
  vagrant up
  </pre>
* this should start a new virtual machine on your workstation and within about 30-45 seconds you should be able to log in by either going to localhost port 2222 with any ssh client or simply by issuing:
  ```
  vagrant ssh
  ```
* To destroy/start over once you're finished:
  ```
  vagrant destroy
  ```
