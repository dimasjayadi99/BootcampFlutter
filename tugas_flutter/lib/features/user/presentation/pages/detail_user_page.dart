import 'package:flutter/material.dart';
import 'package:tugas_flutter/shared/gap.dart';
import '../../data/data_source/remote/user_service.dart';
import '../../data/mapper/user_entity_mapper.dart';
import '../../data/repository/detail_user_impl.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/use_case/fetch_detail_user.dart';

class DetailUserPage extends StatelessWidget {
  final int id;
  const DetailUserPage({super.key, required this.id});

  Future<UserEntity> fetchListUser(int id) async {
    final userService = UserService();
    final userEntityMapper = UserEntityMapper();
    final userRepository = DetailUserImpl(
      userService: userService,
      userEntityMapper: userEntityMapper,
    );
    final fetchListUser = FetchDetailUser(userRepository);

    return await fetchListUser.fetchDetailUser(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail User'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: FutureBuilder<UserEntity>(
            future: fetchListUser(id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                final user = snapshot.data!;
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Image.network(
                          user.avatar,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Gap.v(h: 16),
                      Text(
                        '${user.firstName} ${user.lastName}',
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      const Gap.v(h: 8),
                      Text(user.email),
                    ],
                  ),
                );
              } else {
                return const Center(child: Text('Unexpected error.'));
              }
            },
          ),
        ),
      ),
    );
  }
}
