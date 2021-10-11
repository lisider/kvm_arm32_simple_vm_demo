用Qemu模拟出一个ARM32的Host，然后运行简化版本的虚拟机，
这个虚拟机会自动将guest加载到内存中运行，
guest会输出log以及从host获取信息，最后退出。


include 来自于 linux5.6 $ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- headers_install
include 在 usr/ 中, 将 include 目录整个拷贝到这里就行了



跑起来的状态
root@ubuntu:~# ./simple_virt
Hello World! I am a Guest!
Get From Host: G
Guest Exit!
root@ubuntu:~#
