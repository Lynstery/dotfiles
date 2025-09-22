local components = require("custom.config.heirline.components")

return {
  components.RightPadding(components.Navic, 2),
  components.Fill,
  components.RightPadding(components.LSPActive),
  components.RightPadding(components.LspProgress, 0),
}
