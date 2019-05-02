# Basic genetic algorithm

This code is based on a YouTube tutorial from Code Bullet.
The files run through the app Processing, a Java-based IDE.

The project covers initial setup of a population, including population size and variance.
There are multiple "class" files that contain objects used to manipulate the population, such as inheritance and crossover, random mutation, and, of course, natural selection or fitness.

Simply put, this project uses a genetic algoritm to enable objects to make their way to a goal.

## Barriers

I have added a simple way of adding obstacles for the population to avoid. Using an arraylist, multiple obstacles, or "barriers", can be added. There is a very basic collision engine to detect when a member of the population has encountered an obstacle.

Note that the fitness function is now less than satisfactory with these barriers, since the fitness of a member of the population was basically a measure of its closeness to the goal.
