--[[
local workspace_folder = "~/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
local config = {
    cmd = {

        -- 💀
        'java', -- or '/path/to/java17_or_newer/bin/java'
        -- depends on if `java` is in your $PATH env variable and if it points to the right version.

        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-javaagent:~/.local/share/eclipse/lombok.jar',

        '-jar',
        '~/Programming/personal/java/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_1.6.700.v20240213-1244.jar',
        '-configuration',
        '~/Programming/personal/java/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/config_linux',
        '-data', workspace_folder,

    },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)
]]
