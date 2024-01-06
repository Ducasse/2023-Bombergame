# Bombergame

Bombergame is a clone of the classic Bomberman game. This project is a collaborative effort by Alexandre Benjamin, Hadid Yanis, and Harrar M'hamed.
Developed using Pharo as part of the C3P course curriculum at the University of Lille for the academic year 2023/2024.

At its core, Bombergame revolves around strategic maze-based gameplay. Players navigate through levels, placing bombs to clear obstacles and outmaneuver opponents.

## Installation

### Step 1: Dependency Installation

With a Pharo image ready, open the Playground and execute the following Metacello commands to handle the dependencies.

#### Command 1:

This command installs the 'Bloc' baseline, a core component for the UI framework of the game.

```smalltalk
Metacello new
    baseline: 'Bloc';
    repository: 'github://pharo-graphics/Bloc:05e5b0e385811719537f8cd89966b150a07be985/src';
    onConflictUseIncoming;
    load;
    lock.
```

#### Command 2:

This command fetches the 'Myg' package, an essential library for the game's functionality.

```smalltalk
Metacello new
    repository: 'github://Ducasse/Myg:v1.0.0';
    baseline: 'Myg';
    onConflictUseIncoming;
    load.
```

### Step 3: Cloning the Repository

After installing dependencies, proceed to clone the Bomberman game repository:

1. Open the Git Repositories Browser in Pharo.
2. Click on 'Add' and select the 'Clone from GitHub' tab.
3. Enter the following repository details:
   - Owner Name: `BenjaminAlexandreMiage`
   - Project Name: `Bombergame_C3P`
   - Protocol: HTTPS or SSH depending on your git configuration

4. If the repository status shows 'NOT LOADED', enter the repository and right-click on each folder to select 'Load'.

### Step 4: Verifying the Installation

Finally, use the System Browser to confirm the successful installation. You should see the folders 'Bomberman' and 'Bomberman-Tests' indicating that the setup is complete and the game is ready to be launched.
