pub mod keymaps;
pub mod settings;

use nvim_oxi as oxi;
use oxi::{Dictionary, Error, Function};

#[oxi::module]
fn configs() -> oxi::Result<Dictionary> {
    let setup = Function::from_fn::<_, Error>(move |()| {
        keymaps::init()?;
        settings::init()?;
        Ok(())
    });

    Ok(Dictionary::from_iter([("setup", setup)]))
}
