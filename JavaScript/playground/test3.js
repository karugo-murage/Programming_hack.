import React from "react";

const MyTabsComponent = ({ children }) => {
    // Use console.log() for debugging

    console.log(children)
    const [index, setIndex] = React.useState(0);
    const c = children
    return (
        <div className="tabs">
            <div style={{ width: "100%", display: "flex" }}>
                {c.map((p, i) => (
                    <button
                        style={{ flex: 1, color: index === i ? "grey" : "" }}
                        onClick={() => setIndex(i)}
                    >
                        {p.props.title}
                    </button>
                ))}
            </div>
            {c[index].props.children}
        </div>
    );
};

export default MyTabsComponent;