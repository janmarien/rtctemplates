import React from 'react';

export class Matrix extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            determinant: undefined
        }
        this.calcDeterminant = this.calcDeterminant.bind(this)
    }

    componentDidMount() {
        // TODO
    }

    calcDeterminant() {
        // TODO: calculate determinant whenever matrix changes
    }

    render() {
        var items = [];
        // TODO: Fill in items with the matrix rows
        // use <td><input></input></td> for columns in each rows
        // and <tr>{row}</tr> for each row
        return (
            <div>
                <table>
                    <tbody>
                        {items}
                    </tbody>
                </table>
                <h2>{this.state.determinant}</h2>
            </div>
        )
    }
}