{ fetchurl, minecraftVersion, loaderVersion, installerVersion, jarHash ? "" }:

fetchurl {
  url =
    "https://meta.fabricmc.net/v2/versions/loader/${minecraftVersion}/${loaderVersion}/${installerVersion}/server/jar";
  hash = jarHash;
}
