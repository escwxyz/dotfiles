use nvim_oxi as oxi;
use oxi::{Dictionary, Error, Function, Result};
mod configs;

#[oxi::module]
fn init() -> Result<Dictionary> {
    let setup_configs = Function::from_fn::<_, Error>(move |()| Ok(()));

    let setup_plugins = Function::from_fn::<_, Error>(move |()| Ok(()));

    Ok(Dictionary::from_iter([
        ("setup_configs", setup_configs),
        ("setup_plugins", setup_plugins),
    ]))
}
