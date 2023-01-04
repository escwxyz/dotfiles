local M = {}

M.git_hint =
[[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀_]_: next hunk
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀_[_: prev hunk
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣶⣾⣿⣿⣿⣿⣷⣶⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀_s_: stage hunk
⠀⠀⠀⠀⠀⣠⣿⣿⣿⠙⠛⠿⣿⠿⠿⠿⠿⢿⠿⠛⠋⣿⣿⣿⣄⠀⠀⠀⠀⠀_u_: undo last stage
⠀⠀⠀⠀⢰⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⡆⠀⠀⠀⠀_p_: preview hunk
⠀⠀⠀⠀⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⠀⠀⠀⠀_d_: toggle deleted
⠀⠀⠀⢸⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⡇⠀⠀⠀_f_: differ this
⠀⠀⠀⠈⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⠁⠀⠀⠀
⠀⠀⠀⠀⢻⣿⣿⣿⣿⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣿⣿⣿⣿⡟⠀⠀⠀⠀_b_: toggle blame line  
⠀⠀⠀⠀⠀⢻⣿⣦⡈⢿⣿⣿⡏⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀_B_: show full blame
⠀⠀⠀⠀⠀⠀⠙⢿⣷⣄⣀⣀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⢿⣿⠀⠀⠀⠀⠀⠀⣿⡿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀_<Enter>_: Lazygit
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀_<Esc>_: exit
]]

M.harpoon_hint =
[[
^_m_: mark buffer _p_: prev mark _n_: next mark
^
^^_<Enter>_: menu^^ _<Esc>_: exit     
]]

M.telescope_hint =
[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀_f_: Find Files
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⠿⠿⣿⣦⠀⠀⠀⠀⠀⠀⠀_r_: Find Repos
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣼⣭⡣⣽⣶⣿⠟⠁⠀⠀⠀⠀⠀⠀_h_: Help Tags
⠀⠀⠀⠀⠀⡀⠀⠀⢀⡤⢿⡉⠹⣷⡿⠛⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀_t_: Find Todos
⠀⠀⠀⣠⡾⠃⢠⢴⡅⠀⣈⣿⡺⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀_m_: Harpoon Marks
⠀⠀⠘⠋⠈⠽⣇⠀⡽⠿⠟⣻⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀_a_: Aerial Outline
⠀⠀⠐⢶⣿⠗⠚⠉⠀⢰⣿⢻⣿⣿⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀_k_: Keymaps
⠀⠀⠀⠀⠀⠀⠀⠀⡰⡫⠃⢸⢸⠈⣯⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀_o_: Vim Options
⠀⠀⠀⠀⠀⠀⠀⡰⡳⠁⠀⢸⢸⠀⠘⡲⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀_b_: Search in buffer 
⠀⠀⠀⠀⠀⠀⣰⡥⠁⠀⢀⣼⣼⠀⠀⢳⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀_u_: Undo Tree
⠀⠀⠀⠀⢀⡾⣵⠥⠔⠚⠛⢻⠟⠛⠒⠤⣷⡦⠀⠀⠀⠀⠀⠀⠀⠀_g_: Live Grep
⠀⠀⠀⠀⣼⠝⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⡞⡀⠀⠀⠀⠀⠀⠀⠀_n_: Notify
⠀⠀⠀⠼⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠇⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀_<Esc>_: Exit
]]

M.windows_hint =
[[
    ^^^^^^^^^^^^     Move      ^^    Size   ^^   ^^     Split
    ^^^^^^^^^^^^-------------  ^^-----------^^   ^^---------------
    ^ ^ _k_ ^ ^  ^ ^ _K_ ^ ^   ^   _<C-k>_   ^   _s_: horizontally 
    _h_ ^ ^ _l_  _H_ ^ ^ _L_   _<C-h>_ _<C-l>_   _v_: vertically
    ^ ^ _j_ ^ ^  ^ ^ _J_ ^ ^   ^   _<C-j>_   ^   _q_, _c_: close
    focus^^^^^^  window^^^^^^  ^_=_: equalize^   _z_: maximize
    ^ ^ ^ ^ ^ ^  ^ ^ ^ ^ ^ ^   ^^ ^          ^   _o_: remain only
    _b_: choose buffer
]]

M.options_hint =
[[
      ^ ^        Options
      ^
      _v_ %{ve} virtual edit
      _i_ %{list} invisible characters  
      _s_ %{spell} spell
      _w_ %{wrap} wrap
      _c_ %{cul} cursor line
      _n_ %{nu} number
      _r_ %{rnu} relative number
      ^
           ^^^^                _<Esc>_
]]

return M