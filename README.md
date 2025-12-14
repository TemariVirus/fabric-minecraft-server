# fabric-minecraft-server

Set up a fabric Minecraft server and expose it to the internet a playit tunnel.

## Setup

1. Create a [playit](https://playit.gg/login/) account.
2. Run `start-tunnel.sh` and follow the instructions to set up a tunnel.
3. In the [playit website](https://playit.gg/account/tunnels), create a new tunnel with the `Minecraft Java (game)` Tunnel type.
4. Take note of the public address of the tunnel. This is the address you will give others to connect to your server.
   It should look something like `x.y.z.ply.gg:12345`.
5. Add the tunnel to the agent you created in step 2.

## Usage

Run `start-tunnel.sh` and `start-server.sh` in 2 separate shells simultaneously.
You can access the server console in the shell running `start-server.sh`.

A `.gitignore` is also included so that you can track your server's config with git
because... why not `¯\_(ツ)_/¯`

## Changing Minecraft version

1. Edit the `minecraftVersion` in `flake.nix`.
   You can also change `loaderVersion` and `installerVersion` if you want.
   Follow the steps below to update the hash.
2. Remove the `jarHash = "...";` line and run `nix develop`. You should see something like this:

```plaintext
error: hash mismatch in fixed-output derivation '/nix/store/gpgjadc2v30jf5cqcfgjbbbqfw3jr811-jar.drv':
         specified: sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
            got:    sha256-qj9GxjkoFa2nqiyy/mWoCzVPCtAfulPtIhL00W9rs00=
```

3. Copy the hash back into `flake.nix`.

```nix
jarHash = "sha256-qj9GxjkoFa2nqiyy/mWoCzVPCtAfulPtIhL00W9rs00=";
```

## Installing mods

A `mods` folder is created the first time you run `start-server.sh`.
Place the mods you want to install in the `mods` folder and restart the server.

Search for mods to download on [Modrinth](https://modrinth.com/mods).
