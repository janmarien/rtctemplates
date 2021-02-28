import ReactDOM from 'react-dom'
import ChatBox from './Chatbox.js'

export class ChatObject /* extends ...*/ {

    render(div) {
        ReactDOM.render(<ChatBox /* Add props *//>, div);
        return div;
    }

}

export default ChatObject;