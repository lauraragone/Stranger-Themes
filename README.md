# Stranger-Themes
## A try! Swift Tokyo 2017 Sample Project

This sample project corresponds to the `Color Me Surprised! Architecting a Robust Color System in Swift` talk presented at try! Swift Tokyo 2017.

A link to the presentation and its associated materials will be provided once available.

## What it Does

The contained project features a tab bar controller containing three view controllers:
- a `UIViewController`,
- a `UITableViewController`, and
- a `UICollectionViewController`.

When the user interacts with specific UI elements in each of these three screens, a notification will be broadcast instructing all views to update their appearance to display either a light or a dark theme. These changes are then reflected app-wide.

## How?

### `ColorUpdatable` Protocol

We’ll begin by introducing the protocol, `ColorUpdatable`. This protocol will allow all color updating types to share a common interface. Changes made using the interface reflect upon `ColorUpdatable`-conforming objects, accordingly.

The protocol, itself, is straight-forward.

~~~swift
/// A protocol which denotes types which can update their colors.
protocol ColorUpdatable {
    
    /// The theme for which to update colors.
    var theme: Theme { get set }
    
    /// A function that is called when colors should be updated.
    func updateColors(for theme: Theme)
}
~~~

The `theme` property stores which state the conforming object should display. We need this property to configure the view appropriately during its initial setup.

Next, the `updateColors(for theme:)` function is responsible for updating the colors of all UI elements contained in the conforming object. Label text colors, view background colors, and tint colors should all be specified here. If your view contains children also conforming to `ColorUpdatable`, this function should call through to their `updateColors(for theme:)` functions, as well.

### `ColorChangeObserving` Protocol

With our common `ColorUpdatable` interface established, we can now address the task of observing color update messages. To that end, we must create yet another protocol. We’ll call it `ColorChangeObserving`.

For convenience, the `ColorChangeObserving` protocol will contain functions to both add and remove observance of notifications indicating that the color theme has changed. In order to properly respond to these notifications, the protocol should declare a function to call whenever the notification center’s message is observed.

There’s not much to it!

~~~swift
/// A protocol for responding to `didChangeColorTheme` custom notifications.
protocol ColorThemeObserving {

    /// Registers observance of `didChangeColorTheme` custom notifications.
    func addDidChangeColorThemeObserver(notificationCenter: 
                                                  NotificationCenter)
    
    /// Removes observance of `didChangeColorTheme` custom notifications.
   func removeDidChangeColorThemeObserver(notificationCenter: 
                                                  NotificationCenter)
    
    /// Responds to `didChangeColorTheme` custom notifications.
    func didChangeColorTheme(notification: Notification)

}
~~~

Both adding and removing the theme change observers will call through to the Notification Center’s add and remove observer methods, preconfigured with the name of the color theme change notification. Because we will need to post a custom notification indicating that the color theme has changed, it would be beneficial to limit the number of clients privy to that implementation detail. We’ll be able to add an extension on `ColorChangeObserving` objects to isolate this information.

The selector for the observer will be the `didChangeColorTheme(notification:_)` function included in this protocol.

In practice, you should call the function to add the color theme change observer early in your controller’s lifecycle. This should ensure that posted theme change messages are received. Upon receiving the message, the `didChangeColorTheme(notification:_)` function will be called. We can continue to extend our `ColorChangeObserving` protocol to provide it with some default behavior.

First, we have a few helper functions to create!

~~~swift
// MARK: - ColorThemeObserving

fileprivate extension ColorThemeObserving {
    
    /// Returns the theme specified by the `didChangeColorTheme` notification’s `userInfo`.
    func theme(from notification: Notification) -> Theme? {
        // . . .
        return theme
    }
    
    /// Updates the colors of `ColorUpdatable`-conforming objects.
    func updateColors(from notification: Notification) {
        guard let theme = theme(from: notification) else { return }
        
        if var colorUpdatableObject = self as? ColorUpdatable, theme != colorUpdatableObject.theme {
            colorUpdatableObject.theme = theme
            colorUpdatableObject.updateColors(for: theme)
        }
    }
}
~~~

As I mentioned before, we need to post a custom notification indicating that the color theme has changed. The new theme we’re reconfiguring our views to display should be included in this notification’s user info dictionary. The `theme(from notification:_)` function simply handles the implementation details of extracting the theme from the notification’s user info, returning nil if the theme is not found.

Now, the real magic happens in the `updateColors(from notification:_)`  function.

If you recall, we previously created the `ColorUpdating` protocol to provide a common interface for clients to specify themes and update colors.

We’ll check here to discover whether our `ColorThemeObserving` object also conforms to `ColorUpdatable`. If it does, we’ll instruct the object to reconfigure its appearance to match the new theme.

We should now extend conformance to `ColorThemeObserving` to all `UIViewController`s.

~~~swift
// MARK: - UIViewController

extension UIViewController: ColorThemeObserving {
    
    @objc func didChangeColorTheme(_ notification: Notification) {
        updateColors(from: notification)
    }

    // . . .
}
~~~

From here, we can call our `updateColors(from notification:_)` function each time a color theme change notification is received. With this, any view controller both observing color theme notifications and conforming to `ColorUpdatable` will automatically reflect the new theme.

Of course, you need to take this one step further when working with table and collection views. Luckily, we can take advantage of extensions here, as well.

~~~swift
// MARK: - UITableViewController

extension UITableViewController {
    
    @objc override func didChangeColorTheme(_ notification: Notification) {
        updateColors(from: notification)
        tableView.reloadData()
    }
}

// MARK: - UICollectionViewController

extension UICollectionViewController {
    
    @objc override func didChangeColorTheme(_ notification: Notification) {
        updateColors(from: notification)
        collectionView?.reloadData()
    }
}
~~~

Since both `UITableViewController` and `UICollectionViewController` inherit from `UIViewController`, we can override the behavior we defined in that last slide to automatically reload data.

To see the theme change in action, have your controller conform to `ColorUpdatable`. You can see that theme can now be specified as an argument on each color. Register your `ColorChangeObserving` observer, then post a color theme change notification.

~~~swift
// MARK: - ColorUpdatable

extension ViewController: ColorUpdatable {
    
    func updateColors(for theme: Theme) {
        view.backgroundColor = .contentBackground(for: theme)
        childView.updateColors(for: theme)
        // . . .
    }
}
~~~

Thanks to Swift protocols, that’s all you need to do!
