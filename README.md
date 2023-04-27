A personal dotfiles repo, currently WIP.

## Requirements

Ensure that Rust and Cargo are installed, if not, run the following command:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Then install the [dotlink](https://github.com/TheRealLorenz/dotlink):

`cargo install dotlink`

## Steps

1. First clone the repo via:

```bash
git clone git@github.com:escwxyz/dotfiles.git
```

2. Fetch the submodules:

```bash
cd dotfiles
git submodule update --init --recursive
```

3. Run dotlink:

```bash
dotlink -p preset (macOS / linux)
```

4. Download the `dict.db3` file from [here](https://github.com/iamcco/ds-pinyin-lsp/releases/) and extract it into `nvim` root folder
