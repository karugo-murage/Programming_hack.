import React from "react";

const MyTabsComponent = ({ children }) => {
  // Use console.log() for debugging
  const [index, setIndex] = React.useState(0);
  const c = [
    { title: "s1", c: "Conts 1" },
    { title: "s2", c: "Conts 2" },
    { title: "s3", c: "Conts 3" },
  ];
  return (
    <div className="tabs">
      <div style={{ width: "100%", display: "flex" }}>
        {c.map((p, i) => (
          <button
            style={{ flex: 1, color: index === i ? "grey" : "" }}
            onClick={() => setIndex(i)}
          >
            {p.title}
          </button>
        ))}
      </div>
      {c[index].c}
    </div>
  );
};

export default MyTabsComponent;
