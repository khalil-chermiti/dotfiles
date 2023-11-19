local wilder = require('wilder')

wilder.set_option('renderer', wilder.popupmenu_renderer())

wilder.setup({ modes = { ':', '/', '?' } })
