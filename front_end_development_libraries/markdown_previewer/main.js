const INITAIL_MARKDOWN = `
# Welcome to my React Markdown Previewer!

## This is a sub-heading...
### And here's some other cool stuff:

Heres some code, \`<div></div>\`, between 2 backticks.

\`\`\`
// this is multi-line code:

function anotherExample(firstLine, lastLine) {
  if (firstLine == '\`\`\`' && lastLine == '\`\`\`') {
    return multiLineCode;
  }
}
\`\`\`

You can also make text **bold**... whoa!
Or _italic_.
Or... wait for it... **_both!_**
And feel free to go crazy ~~crossing stuff out~~.

There's also [links](https://www.freecodecamp.org), and
> Block Quotes!

And if you want to get really crazy, even tables:

Wild Header | Crazy Header | Another Header?
------------ | ------------- | -------------
Your content can | be here, and it | can be here....
And here. | Okay. | I think we get it.

- And of course there are lists.
  - Some are bulleted.
     - With different indentation levels.
        - That look like this.


1. And there are numbered lists too.
1. Use just 1s if you want!
1. And last but not least, let's not forget embedded images:

![freeCodeCamp Logo](https://cdn.freecodecamp.org/testable-projects-fcc/images/fcc_secondary.svg)
`

class Editor extends React.Component {
    constructor(props) {
        super(props);
    }

    componentDidMount() {
        this.props.onChange(INITAIL_MARKDOWN);
    }

    render() {
        return (
            <textarea id={'editor'} value={this.props.markDown || ""} onChange={(event) => this.props.onChange(event.target.value)}></textarea>
        );
    }
};

class Preview extends React.Component {
    constructor(props) {
        super(props);
    }

    render() {
        return (
            <div id={'preview'} dangerouslySetInnerHTML={{ __html: marked.parse(this.props.markDown) }}></div>
        );
    }
};

class Main extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            markDown: ''
        };

        this.updateMarkdown = this.updateMarkdown.bind(this);
    }

    updateMarkdown(changedMarkdown) {
        this.setState({
            markDown: changedMarkdown
        });
    }

    render() {
        return (
            <main>
                <Editor markDown={this.state.markDown} onChange={this.updateMarkdown} />
                <Preview markDown={this.state.markDown} />
            </main>
        );
    }
};

marked.use({
    gfm: true,
    breaks: true
});

ReactDOM.createRoot(document.getElementById('root')).render(React.createElement(Main));
