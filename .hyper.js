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
    cursorAccentColor: '#000',
    cursorShape: 'BLOCK',
    cursorBlink: false,
    foregroundColor: '#fff',
    backgroundColor: '#000',
    selectionColor: 'rgba(248,28,229,0.3)',
    borderColor: '#333',
    padding: '12px 14px',
    wickedBorder: true,
    wickedBorderColor: '#ffc600'
  },
  plugins: ["hyper-corubo", "hyperpower", "hyper-pane", "hyper-search"]
};
