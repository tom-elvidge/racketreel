import 'package:firebase_auth/firebase_auth.dart';
import 'package:grpc/grpc.dart';

class AuthInterceptor implements ClientInterceptor {
  final FirebaseAuth firebaseAuth;

  AuthInterceptor({
    required this.firebaseAuth,
  });

  @override
  ResponseFuture<R> interceptUnary<Q, R>(ClientMethod<Q, R> method, Q request, CallOptions options, invoker) {

    final modifiedOptions = options.mergedWith(
      CallOptions(
        providers: [
          _injectToken,
        ],
      ),
    );

    return invoker(method, request, modifiedOptions);
  }

  @override
  ResponseStream<R> interceptStreaming<Q, R>(ClientMethod<Q, R> method, Stream<Q> requests, CallOptions options, ClientStreamingInvoker<Q, R> invoker) {
    final modifiedOptions = options.mergedWith(
      CallOptions(
        providers: [
              (Map<String, String> metadata, String uri) {
            return _injectToken(metadata, uri);
          },
        ],
      ),
    );

    return invoker(method, requests, modifiedOptions);
  }

  Future<void> _injectToken(Map<String, String> metadata, String uri) async {
    final user = firebaseAuth.currentUser;

    if (user != null) {
      try {
        final token = await user.getIdToken();

        // https://learn.microsoft.com/en-us/aspnet/core/grpc/authn-and-authz?view=aspnetcore-8.0
        metadata['Authorization'] = "Bearer $token";
      }
      catch (e) {
        // there can sometimes be an issue getting a new id token
        // forcing the user to log in again fixes it but not an ideal solution
        await firebaseAuth.signOut();
      }
    }
  }
}