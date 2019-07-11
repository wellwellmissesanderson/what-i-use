// These are my overwrites
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    updateChannel: 'stable',
    fontSize: 18,
    // I use Skyfonts locally for non-standard fonts
    fontFamily: '"Inconsolata", Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
    fontWeight: 'normal',
    fontWeightBold: 'bold',
    cursorColor: 'rgba(248,28,229,0.8)',
    cursorShape: 'BLOCK',
    // padding: '12px 14px',
    summon: {
      hideDock: false,
      hideOnBlur: false,
      hotkey: 'Control+H',
    }
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
    "hyperborder"
  ]
};
