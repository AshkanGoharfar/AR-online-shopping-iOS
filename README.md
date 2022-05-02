# Smart Online Shopping iOS App with Augmented Reality (AR) feature

# Table of contents
- [App Demo](#App-Demo)
- [How to Run](#How-to-Run)
- [Context](#Context)
- [Content](#Content)
- [How it's written](#How-it's-written)
- [Inspiration](#Inspiration)


# App Demo

![AR online shopping iOS demo](https://user-images.githubusercontent.com/25262431/166336720-4e040eb5-8965-4564-b709-524ed7c9a547.gif)


https://user-images.githubusercontent.com/25262431/166336940-211d49ad-1961-4369-be35-b5a7c445116d.mp4



# How to Run
First make sure to install XCode version 13 or later and have iPhone X or later versions.

Clone the repository:
```bash
git clone https://github.com/AshkanGoharfar/AR-online-shopping-iOS.git
```

Go to the project directory.
```bash
cd AR-online-shopping-iOS
```

Next, Run the following command to create podfile.
```bash
pod init
```


Open the podfile by the following command to add the dependencies.
```bash
open podfile
```

Copy and paste the follwing text to the podfile


```
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'AR-online-shopping-iOS' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for AR-online-shopping-iOS

  target 'AR-online-shopping-iOSTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'AR-online-shopping-iOSUITests' do
    # Pods for testing
  end

  pod 'Firebase/Core'
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'
  pod 'Firebase/Storage'
  pod 'SDWebImageSwiftUI'

end
```

Run the following command to install the dependencies to the podfile.
```bash
pod install
```
Finally, Open the AR-online-shopping-iOS.xcworkspace file in the Xcode. Connect your iphone to your MacBook and run the code :)

# Context
### How Augmented Reality in Ecommerce Can Deliver a More Enticing Shopping Experience?

One of the biggest challenges of online shopping is that it doesn’t lend itself well to a full sensory product experience. In a brick-and-mortar environment, you can try on clothes, touch fabrics, or see for yourself just how big a couch looks in a room. 

While those things aren’t technically possible in ecommerce, augmented reality (AR) applications offer a way to give customers deeper and more complete information about your products — right from their own home.

# Content
This code is impleneted and fully tested on an iPhone XR with iOS 15.4 version.

# How it's written
The front-end was implemented using SwiftUI, ARKit, MessageUI, and FocusEntity. The User Authentication and Cloud Stroge was developed using Google Firebase.


# Inspiration

We would be more than happy for any future collaboration towards adding new features and improving screens.
