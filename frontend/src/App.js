import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './App.css';

function App() {
  const [recipes, setRecipes] = useState([]);
  const [name, setName] = useState('');
  const [ingredients, setIngredients] = useState('');
  const [instructions, setInstructions] = useState('');
  const [searchQuery, setSearchQuery] = useState('');
  const API_URL = process.env.REACT_APP_API_URL || 'http://localhost:5000/api';


  // Fetch recipes on page load
  useEffect(() => {
    fetchRecipes();
  }, []);

  const fetchRecipes = async () => {
    try {
      const response = await axios.get(`${API_URL}/recipes`);
      setRecipes(response.data);
    } catch (error) {
      console.error('Error fetching recipes:', error);
    }
  };

  // Add recipe
  const addRecipe = async (e) => {
    e.preventDefault();
    try {
      await axios.post(`${API_URL}/recipes`, { name, ingredients, instructions });
      fetchRecipes(); // Refresh the list
      setName('');
      setIngredients('');
      setInstructions('');
    } catch (error) {
      console.error('Error adding recipe:', error);
    }
  };

  // Delete recipe
  const deleteRecipe = async (id) => {
    try {
      await axios.delete(`${API_URL}/recipes/${id}`);
      fetchRecipes(); // Refresh the list
    } catch (error) {
      console.error('Error deleting recipe:', error);
    }
  };

  // Search recipes
  const filteredRecipes = recipes.filter((recipe) =>
    recipe.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
    recipe.ingredients.toLowerCase().includes(searchQuery.toLowerCase())
  );

  return (
    <div className="App">
      <h1>Moroccan Recipe Sharing App</h1>
      <form onSubmit={addRecipe}>
        <input
          type="text"
          placeholder="Recipe Name"
          value={name}
          onChange={(e) => setName(e.target.value)}
          required
        />
        <textarea
          placeholder="Ingredients"
          value={ingredients}
          onChange={(e) => setIngredients(e.target.value)}
          required
        />
        <textarea
          placeholder="Instructions (separate steps with a new line)"
          value={instructions}
          onChange={(e) => setInstructions(e.target.value)}
          required
        />
        <button type="submit">Add Recipe</button>
      </form>
      <input
        type="text"
        placeholder="Search recipes..."
        value={searchQuery}
        onChange={(e) => setSearchQuery(e.target.value)}
      />
      <ul>
        {filteredRecipes.map((recipe) => (
          <li key={recipe.id}>
            <h2>{recipe.name}</h2>
            <h3>Ingredients:</h3>
            <p>{recipe.ingredients}</p>
            <h3>Instructions:</h3>
            <div className="instructions">
              {recipe.instructions.split('\n').map((step, index) => (
                <p key={index}>{step}</p>
              ))}
            </div>
            <button onClick={() => deleteRecipe(recipe.id)}>Delete</button>
          </li>
        ))}
      </ul>
    </div>
  );
}

export default App;
