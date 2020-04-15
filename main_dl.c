#include <dlfcn.h>
typedef void (*Tfunc)();
int main(){
	void *dll=dlopen("libfunc.so",RTLD_NOW | RTLD_GLOBAL);
	Tfunc func = (Tfunc)dlsym(dll,"func");
	func();
}
