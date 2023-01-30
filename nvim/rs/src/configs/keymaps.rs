use nvim_oxi::{
    api::{opts::SetKeymapOptsBuilder, set_keymap, types::Mode},
    Result,
};

pub fn init() -> Result<()> {
    set_keymap(Mode::Normal, "<left>", "", &Default::default())?;
    set_keymap(Mode::Normal, "<right>", "", &Default::default())?;
    set_keymap(Mode::Normal, "<up>", "", &Default::default())?;
    set_keymap(Mode::Normal, "<down>", "", &Default::default())?;

    set_keymap(
        Mode::Normal,
        "j",
        "v:count == 0 ? 'gj' : 'j'",
        &SetKeymapOptsBuilder::default().expr(true).build(),
    )?;
    set_keymap(
        Mode::Visual,
        "j",
        "v:count == 0 ? 'gj' : 'j'",
        &SetKeymapOptsBuilder::default().expr(true).build(),
    )?;
    set_keymap(
        Mode::Normal,
        "k",
        "v:count == 0 ? 'gk' : 'k'",
        &SetKeymapOptsBuilder::default().expr(true).build(),
    )?;
    set_keymap(
        Mode::Visual,
        "k",
        "v:count == 0 ? 'gk' : 'k'",
        &SetKeymapOptsBuilder::default().expr(true).build(),
    )?;

    set_keymap(
        Mode::Normal,
        "<C-a>",
        "gg<S-v>G",
        &SetKeymapOptsBuilder::default().desc("Select all").build(),
    )?;

    set_keymap(
        Mode::Normal,
        "<Tab>",
        "<cmd>bnext<CR>",
        &SetKeymapOptsBuilder::default().desc("Next buffer").build(),
    )?;

    Ok(())
}
