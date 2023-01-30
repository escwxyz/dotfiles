use nvim_oxi as oxi;
use oxi::{
    api::{self, opts::OptionValueOpts},
    Result,
};

pub fn init() -> Result<()> {
    api::set_option_value("breakindent", true, &OptionValueOpts::default())?;

    api::set_option_value("cmdwinheight", 5, &OptionValueOpts::default())?;

    api::set_option_value("confirm", true, &OptionValueOpts::default())?;

    api::set_option_value("equalalways", false, &OptionValueOpts::default())?;

    api::set_option_value("laststatus", 3, &OptionValueOpts::default())?;

    Ok(())
}
