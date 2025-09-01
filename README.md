# SwarmIT applications for the DotBots

This repositories contains samples applications that can be used on
[DotBots](https://github.com/dotbots/dotbot-firmware) robots in conjunction
with the [SwarmIT](https://github.com/dotbots/swarmit) infrastructure.

[SwarmIT](https://github.com/dotbots/swarmit) provides a lightweight
infrastructure to turn a swarm of robots in a testbed.

5 sample applications, compatible with SwarmIT, are provided to show how to
adapt DotBot-firmware code.
The sample applications are only compatible with the DotBot-v2 and DotBot-v3
targets, the only DotBot platforms powered by an nRF53 microcontroller, which
is a requirement of SwarmIT.

## Usage

### Get the code

dobtot-swarmit depends on the [DotBot-firmware](https://github.com/DotBots/DotBot-firmware)
repository. It is included in the codebase as a [Git submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules).

Use the following command to clone the SwarmIT codebase locally:

```
git clone --recurse-submodules https://github.com/DotBots/dotbot-swarmit.git
```

### Build firmwares

The source code of the different applications available in this repository can be built using SEGGER Embedded Studio for ARM. 
In SEGGER embedded studio, use the package manager (available in menu Tools > Package manager) to install the CMSIS 5 CMSIS-CORE, CMSIS-DSP and nRF packages.

You can build the applications for dotbot-v3, dotbot-v2 or nrf5340dk depending on your target.

For details on SEGGER Embedded Studio, read the [online documentation](https://studio.segger.com/index.htm?https://studio.segger.com/home.htm).

After building, for example if you want to run the move application, you will find the binary file inside

 `<application directory>/Output/dotbot-v3/Debug/Exe/move-dotbot-v3.bin`
 
that you can use to flash using [SwarmIT](https://github.com/DotBots/swarmit?tab=readme-ov-file#usage).

You can also write new applications following the DotBot API: https://dotbot-firmware.readthedocs.io/en/rel-1.13.1/api.html

## License

The code in this repository is published under the
[BSD 3-Clause license](LICENSE.txt).
