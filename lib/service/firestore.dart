part of layou_tools;

class LaYouFirestore {
  LaYouFirestore._();
  static final instance = LaYouFirestore._();

  DocumentSnapshot? lastUserDocument;

  void print(String str) {
    debugPrint('[LaYouFirestore] $str');
  }

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
    bool log = false,
    bool merge = false,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    if (log) print('set: $path: $data');
    await reference.set(data, SetOptions(merge: merge));
  }

  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    bool log = false,
  }) async {
    final reference = FirebaseFirestore.instance.collection(path);
    if (log) print('add: $path: $data');
    await reference.add(data);
  }

  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
    bool log = false,
    bool createIfNotExists = false,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    if (log) print('update: $path: $data');
    await reference.update(data).catchError((e) {
      if (log) print('update error: $e');
      if (createIfNotExists) {
        if (log) print('file not exist so create it');
        reference.set(data);
      }
    });
  }

  Future<void> deleteData({required String path, bool log = false}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    if (log) print('delete: $path');
    await reference.delete();
  }

  Future<T> getDocument<T>({
    required String path,
    required T builder(Map<String, dynamic>? data, String documentID),
    bool log = true,
    bool createIfNotExists = false,
  }) async {
    final fireStoreItem = await FirebaseFirestore.instance.doc(path).get();
    if (log) print('get: $path');
    return builder(fireStoreItem.data(), fireStoreItem.id);
  }

  Future<List<T>> getCollectionGroup<T>({
    required String path,
    required T builder(Map<String, dynamic>? data, String documentID),
    Query queryBuilder(Query query)?,
    int sort(T lhs, T rhs)?,
    int? limit,
  }) async {
    Query query = FirebaseFirestore.instance.collectionGroup(path);

    if (queryBuilder != null) query = queryBuilder(query);

    if (limit != null) query = query.limit(limit);

    final QuerySnapshot queryDoc = await query.get();

    final List<T> listItems = queryDoc.docs
        .map((snapshot) => builder(
            snapshot.data() as Map<String, dynamic>?, snapshot.reference.path))
        .toList();

    return listItems;
  }

  Future<List<T>> getCollection<T>({
    required String path,
    required T builder(Map<String, dynamic>? data, String documentID),
    Query queryBuilder(Query query)?,
    int sort(T lhs, T rhs)?,
    int? limit,
  }) async {
    Query query = FirebaseFirestore.instance.collection(path);

    if (queryBuilder != null) query = queryBuilder(query);

    if (limit != null) query = query.limit(limit);

    final QuerySnapshot queryDoc = await query.get();

    final List<T> listItems = queryDoc.docs
        .map((snapshot) =>
            builder(snapshot.data() as Map<String, dynamic>?, snapshot.id))
        .toList();

    return listItems;
  }

  Stream<List<T>> collectionStream<T>({
    required String path,
    required T builder(Map<String, dynamic>? data, String documentID),
    Query queryBuilder(Query query)?,
    int sort(T lhs, T rhs)?,
    int? limit,
  }) {
    Query query = FirebaseFirestore.instance.collection(path);

    if (limit != null) query = query.limit(limit);

    if (queryBuilder != null) query = queryBuilder(query);

    final Stream<QuerySnapshot> snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      if (snapshot.docs.isNotEmpty) lastUserDocument = snapshot.docs.last;
      final result = snapshot.docs
          .map((snapshot) =>
              builder(snapshot.data() as Map<String, dynamic>?, snapshot.id))
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  Stream<T> documentStream<T>({
    required String path,
    required T builder(Map<String, dynamic>? data, String documentID),
  }) {
    final DocumentReference reference = FirebaseFirestore.instance.doc(path);
    final Stream<DocumentSnapshot> snapshots = reference.snapshots();

    return snapshots.map((snapshot) =>
        builder(snapshot.data() as Map<String, dynamic>?, snapshot.id));
  }

  Future<bool> checkIfDocExists({
    required String collectionPath,
    required String docId,
    bool log = false,
  }) async {
    try {
      var collectionRef = FirebaseFirestore.instance.collection(collectionPath);
      var doc = await collectionRef.doc(docId).get();
      if (log) print('checkIfDocExists: ${doc.exists}');
      return doc.exists;
    } catch (e) {
      return false;
    }
  }
}
