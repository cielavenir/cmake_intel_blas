#include <dlfcn.h>
typedef void (*Tfunc)();
int main(){
	void *dll=dlopen("libfunc.so",RTLD_NOW);// | RTLD_GLOBAL);
	Tfunc func = (Tfunc)dlsym(dll,"func");
	func();
	//void *dll2=dlopen("libfunc_blas.so",RTLD_NOW);
	//Tfunc func2 = (Tfunc)dlsym(dll2,"func");
	//func2();
}
