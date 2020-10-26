
import UIKit
import CoreData
 
@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
    print("Document Directory: ", FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last ?? "Not found!")
    
      window = UIWindow(frame: UIScreen.main.bounds)
      let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
        
//    let PVC = storyboard.instantiateViewController(withIdentifier:"Parent")
//    window?.rootViewController = PVC
    let FVC = storyboard.instantiateViewController(withIdentifier:"FirstVC")
    window?.rootViewController = FVC
  //  let VC = storyboard.instantiateViewController(withIdentifier:"NVC")
  //  window?.rootViewController = VC
  //  let SVC = storyboard.instantiateViewController(withIdentifier:"SecondVC")
  //
  //      window?.rootViewController = SVC
        
    window?.makeKeyAndVisible()
       
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
       
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
     
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
     saveContext()
    }
    
@objc lazy public var persistentContainer: NSPersistentContainer = {
                
        let container = NSPersistentContainer(name: "CoredataModel")
    
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error as NSError? {
     
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
            
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

