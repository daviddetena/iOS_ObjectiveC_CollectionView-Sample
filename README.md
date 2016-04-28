## CollectionView sample
This shows a basic use of CollectionViews on iOS, written for Objective-C.

Our CollectionView has two sections with cells representing different colors. It has two sections:

* One for **solid colors** randomly generated:
	
	The cells in this sections are based on a custom CollectionViewCell class. Breaking MVC pattern, in this case, the cell has a reference to the model, which is a color. These cells use KVO to suscribe for changes on the background of their model (a UIColor). The cells also present a short animation when  the background changes its color after a tap.
	
* One for colors creating a **gradient**.


Some options for CollectionView layout are also added to our custom CollectionView when created in AppDelegate.