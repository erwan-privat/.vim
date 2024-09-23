let g:godot_executable = 'flatpak run org.godotengine.Godot'
setlocal shiftwidth=2
setlocal tabstop=2
nnoremap <buffer> <F4> :GodotRunLast<CR>
nnoremap <buffer> <F5> :GodotRun<CR>
nnoremap <buffer> <F6> :GodotRunCurrent<CR>
nnoremap <buffer> <F7> :GodotRunFZF<CR>
