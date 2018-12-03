import os


def fun(path):
    lst = os.listdir(path)
    for i in lst:
        son_path = os.path.join(path, i)
        new_path = son_path.replace('.下载', '')
        os.rename(son_path, new_path)


# fun(r'C:\Users\shu\Desktop\home_files')
