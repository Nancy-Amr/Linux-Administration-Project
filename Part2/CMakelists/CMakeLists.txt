cmake_minimum_required(VERSION 3.10)


project(My_Cipher_App

	VERSION 1.0
	DESCRIPTION "The full project cmake file."
	LANGUAGES C)

add_subdirectory(../Modules/caesar_cipher caesar_build)
add_subdirectory(../Modules/xor_cipher    xor_build)



add_executable(output app.c)
target_link_libraries(output PRIVATE caesar xor)

target_compile_options(caesar PRIVATE -Wall -Wextra -Wpedantic)

target_include_directories(output PRIVATE
    ../Modules/caesar_cipher
    ../Modules/xor_cipher
)
