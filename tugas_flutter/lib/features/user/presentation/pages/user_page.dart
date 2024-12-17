import 'package:flutter/material.dart';
import 'package:tugas_flutter/features/user/presentation/pages/detail_user_page.dart';
import 'package:tugas_flutter/features/user/presentation/widgets/card_user.dart';
import '../../data/data_source/remote/user_service.dart';
import '../../data/mapper/user_entity_mapper.dart';
import '../../data/repository/user_impl.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/use_case/fetch_list_user.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  /// note : agar lebih rapih, dapat terapkan dependency injection kedepannya
  Future<List<UserEntity>> fetchListUser() async {
    final userService = UserService();
    final userEntityMapper = UserEntityMapper();
    final userRepository = UserRepositoryImpl(
      userService: userService,
      userEntityMapper: userEntityMapper,
    );
    final fetchListUser = FetchListUser(userRepository);

    return await fetchListUser.fetchListUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List User'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: FutureBuilder<List<UserEntity>>(
            future: fetchListUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                return const Center(child: Text('No users found.'));
              } else if (snapshot.hasData) {
                final listUser = snapshot.data!;
                return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: listUser.length,
                  itemBuilder: (context, index) {
                    final user = listUser[index];
                    return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  DetailUserPage(id: user.id)));
                        },
                        child: CardUser(
                          image: user.avatar,
                          email: user.email,
                          name: user.firstName + user.lastName,
                        ));
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 32),
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
