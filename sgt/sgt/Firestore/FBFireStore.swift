//
//  FBFireStore.swift
//  sgt
//
//  Created by Christian Riccio on 11/02/22.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

/// A The functions used by the package to retrieve the user information, update and delete account
public enum FBFirestore {
    /// Retrieves the FBUser instance
    /// - Parameters:
    ///   - uid: The userID
    ///   - completion: a result providing the FBUser or an error
    static func retrieveFBUser(uid: String) -> UserViewModel? {
        
        let reference = Firestore
            .firestore()
            .collection("users")
            .document(uid)
        
        var user: UserViewModel? = nil
        print("trigged before reference")
        reference.getDocument{(document, error) in
            if let document = document, document.exists{
                print(document.exists)
                do {
                    user = try document.data(as: UserViewModel.self)
                    print(user!)
                }catch {
                    print(error)
                }
            }else{
                return
            }
        }
        return user
    }
    /// Upates the user name
    /// - Parameters:
    ///   - newName: new name provided
    ///   - uid: the unique userID
    ///   - completion: the result providing a success or an error
    static func updateUserName(with newName: String, uid: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        let reference = Firestore.firestore().collection(FBKeys.CollectionPath.users)
            .document(uid)
        reference.setData(["name": newName], merge: true) { err in
            if let err = err {
                completion(.failure(err))
                return
            }
            completion(.success(true))
        }
    }
    /// Creates the new user
    /// - Parameters:
    ///   - fbUser: an instance of FBUser
    ///   - uid: the unique ID generated
    ///   - completion: the result providing a success or an error
    static func mergeFBUser(fbUser: FBUser, uid: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        let reference = Firestore
            .firestore()
            .collection(FBKeys.CollectionPath.users)
            .document(uid)
        do {
            _ =  try reference.setData(from: fbUser, merge: true)
            completion(.success(true))
        } catch {
            completion(.failure(error))
        }
    }
    /// retrieves the document snapshot for the user collection
    /// - Parameters:
    ///   - reference: the document reference
    ///   - completion: a completion handler providing the resulting data or an error
    fileprivate static func getDocument(for reference: DocumentReference,
                                        completion: @escaping (Result<DocumentSnapshot, Error>) -> Void) {
        reference.getDocument { (documentSnapshot, err) in
            if let err = err {
                completion(.failure(err))
                return
            }
            guard let documentSnapshot = documentSnapshot else {
                completion(.failure(FireStoreError.noDocumentSnapshot))
                return
            }
            completion(.success(documentSnapshot))
        }
    }
    /// Deletes the user account
    /// - Parameters:
    ///   - uid: the unique user ID
    ///   - completion: a completion result of a success or an error
    public static func deleteUserData(uid: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        let reference = Firestore
            .firestore()
            .collection(FBKeys.CollectionPath.users)
            .document(uid)
        reference.delete { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(true))
            }
        }
    }
}
