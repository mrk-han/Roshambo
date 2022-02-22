# Roshambo
Rock paper scissors app to practice 3 ways of presenting ViewControllers

Tapping on rock creates, casts and presents the ResultsViewController using only code. (Code demo)

Tapping on paper creates the ViewController and Segue using Storyboard, then uses the `performSegue()` method + `override func prepare(for segue: UIStoryboardSegue)` method to populate the new Viewcontroller (Mix of Code/No Code demo)

Tapping on scissors creates the ViewController and Segue using storyboard, and presents the storyboard through a direct action from the scissors button to the ResultsViewController (Low/No code demo)
