# blt_hasher
# by shinrax2
# version: 1
import hashlib, os
import zipfile



def getfiles(dirpath):
    f =  []
    for root, dirs, files in os.walk(dirpath):
        for file in files:
            if os.path.isfile(os.path.join(root, file)):
                f.append(os.path.join(root, file))
    f.sort(key=str.lower)
    return f

def hashl(line):
    hash = hashlib.sha256()
    hash.update(line)
    return hash.hexdigest()

def hashit(file, block_size=65536):
    hash = hashlib.sha256()
    with open(file, "rb") as f:
        for line in iter(lambda: f.read(block_size), b''):
            hash.update(line)
    return hash.hexdigest()

# Zip Function
def zipdir(path, ziph):
    # ziph is zipfile handle
    for root, dirs, files in os.walk(path):
        for file in files:
            ziph.write(os.path.join(root, file))

if __name__ == "__main__":




    zipf = zipfile.ZipFile('PAYDAY2_thai_updates_property/PD2TH.zip', 'w', zipfile.ZIP_DEFLATED)
    zipdir('PD2TH/', zipf)
    zipf.close()




    import argparse
    hash = ''
    parser = argparse.ArgumentParser(description="Enter path for the folder you want to have hashed(sha256)")
    parser.add_argument('path', metavar='path', type=str, nargs=1, help='path for the folder to be hashed')
    arg = parser.parse_args()
    if arg.path:
        hashstr = ""
        files = getfiles(arg.path[0])
        for file in files:
            hash = hashit(file)
            hashstr = hashstr + hash
        result = hashl(bytes(hashstr, 'ascii'))
        print(result)

# Generate output
script_path = os.path.abspath(__file__)
script_dir = os.path.split(script_path)[0]
rel_path = "PAYDAY2_thai_updates_property\meta.json"
abs_file_path = os.path.join(script_dir, rel_path)

OutFile = open(abs_file_path,"w+")

OutFile.write('[\n\t{\n\t\t"ident": "PD2TH",\n\t\t"hash": "')
OutFile.write(result)
OutFile.write('",\n\t\t"patchnotes_url": "https://censor1337.github.io/PAYDAY2ThaiLanguage/",\n\t\t"download_url": "https://censor1337.github.io/PAYDAY2ThaiLanguage/PAYDAY2_thai_updates_property/PD2TH.zip"\n\t}\n]\n')