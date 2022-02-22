# Roshambo
Rock paper scissors app to practice 3 ways of presenting ViewControllers

<img width="358" alt="image" src="https://user-images.githubusercontent.com/22263679/155044569-288799db-884b-41b5-b00b-bfb5b56298aa.png">
<img width="355" alt="image" src="https://user-images.githubusercontent.com/22263679/155044587-95d00e9e-1cd8-4bc3-9953-956c7aa018f4.png">


## Code (Rock)
Tapping on rock creates, casts and presents the ResultsViewController using only code. (Code demo)

## Code + Storyboard (Paper)
Tapping on paper creates the ViewController and Segue using Storyboard, then uses the `performSegue()` method + `override func prepare(for segue: UIStoryboardSegue)` method to populate the new Viewcontroller (Mix of Code/No Code demo)

## Storyboard (Scissors)
Tapping on scissors creates the ViewController and Segue using storyboard, and presents the storyboard through a direct action from the scissors button to the ResultsViewController (Low/No code demo)
