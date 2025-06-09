import React from 'react';

const City = ({ name, population, state }) => {
  return (
    <div className="bg-slate-700 rounded-md p-4 shadow-lg text-center border border-cyan-300 shadow-indigo-500/50 hover:scale-105 duration-200">
      <div className="text-teal-300 font-bold">
        {name}, {state}
      </div>
      <div className="text-sm text-teal-300/60">Population: {population}</div>
    </div>
  );
};

export default City;
