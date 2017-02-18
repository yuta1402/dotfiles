const setNormalMap = (option, value) => {
    option = 'mode.normal.' + option;
    vimfx.set(option, value);
};

const addNormalMap = (option, value) => {
    option = 'mode.normal.' + option;
    vimfx.set(option, vimfx.get(option) + '    ' + value);
};

const addCaretMap = (option, value) => {
    option = 'mode.caret.' + option;
    vimfx.set(option, vimfx.get(option) + '    ' + value);
};

const addHintsMap = (option, value) => {
    option = 'mode.hints.' + option;
    vimfx.set(option, vimfx.get(option) + '    ' + value);
};

setNormalMap('scroll_left' , '');
setNormalMap('scroll_right', '');

setNormalMap('history_back'   , 'h');
setNormalMap('history_forward', 'l');

addNormalMap('tab_select_previous', 'H');
addNormalMap('tab_select_next'    , 'L');

// mapping ctrl+[ same as escape
addNormalMap('esc', '<force><c-[>');
addCaretMap('exit', '<c-[>');
addHintsMap('exit', '<c-[>');
vimfx.set('mode.find.exit' , vimfx.get('mode.find.exit')  + '    ' + '<c-[>');
vimfx.set('mode.marks.exit', vimfx.get('mode.marks.exit') + '    ' + '<c-[>');
