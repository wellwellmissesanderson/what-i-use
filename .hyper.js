// These are my overwrites
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    updateChannel: 'stable',
    fontSize: 18,
    // I use Skyfonts locally for non-standard fonts
    fontFamily: '"Inconsolata", Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
    cursorShape: 'BLOCK',
    cursorAccentColor: "#ff00ee",
    summon: {
      hideDock: false,
      hideOnBlur: false,
      hotkey: 'Control+H',
    },
    confirmQuit: true
  },
  plugins: [
    "hyperpower",
    "hyper-pane",
    "hyper-search",
    "gitrocket",
    "hyperline",
    "hypercwd",
    "hyperterm-summon",
    "hyper-statusline",
    "hyperborder",
    "hyper-corubo"
  ]
};
