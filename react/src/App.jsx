import { useState, useEffect } from 'react';
import City from './components/City';

function App() {
  const [cities, setCities] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetch('http://localhost:3030/cities')
      .then((response) => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.json();
      })
      .then((data) => {
        setCities(data);
        setLoading(false);
      })
      .catch((error) => {
        setError(error.message);
        setLoading(false);
      });
  }, []);

  if (loading) return <div>Loading...</div>;
  if (error) return <div>Error: {error}</div>;

  return (
    <div className="bg-slate-900">
      <div className="flex flex-col items-center justify-center min-h-screen">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
          <div className="md:col-span-4 bg-slate-700 rounded-md shadow-lg text-center border border-cyan-300 shadow-indigo-500/50 mb-10 py-3">
            <h1 className="text-4xl font-bold text-teal-300 text-shadow-lg text-shadow-color-indigo-500/50">
              Cities
            </h1>
          </div>
          {cities.map((city) => (
            <City
              key={city.id}
              name={city.name}
              state={city.state}
              population={city.population}
            />
          ))}
        </div>
      </div>
    </div>
  );
}

export default App;
