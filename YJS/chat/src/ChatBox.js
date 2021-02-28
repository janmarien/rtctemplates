import React from 'react';

export class ChatBox extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            name: 'Guest',
            message: ''
        }

        this.updateName = this.updateName.bind(this)
        this.updateMessage = this.updateMessage.bind(this)
        this.sendMessage = this.sendMessage.bind(this)
    }

    componentDidMount() {
        // TODO
    }

    sendMessage() {
        // TODO
    }

    updateName(newName) {
        this.setState({
            name: newName
        })
    }

    updateMessage(newMessage) {
        this.setState({
            message: newMessage
        })
    }

    render() {
        return (
            <div>
                <div>
                    <textarea 
                    readOnly
                    rows={20}
                    cols={50}
                    /*value={FILL IN}*/
                    > </textarea>
                </div>
                <div>
                    Name:
                    <textarea rows={1} cols={30} value={this.state.name} onChange={ e => this.updateName(e.target.value)}></textarea>
                </div>
                <div>
                    Message:
                    <textarea rows={4} cols={30} value={this.state.message} onChange={e => this.updateMessage(e.target.value)}></textarea>
                    <button onClick={this.sendMessage} type="button">Send</button>
                </div>
            </div>
        )
    }
}

export default ChatBox;