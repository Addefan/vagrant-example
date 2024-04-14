cd "C:\Users\vagrant\Desktop"
git clone https://github.com/Addefan/VimeCheckify.git
cd VimeCheckify
python -m venv venv
venv\Scripts\Activate
echo "cython<3" > constraint.txt
$Env:PIP_CONSTRAINT = "constraint.txt"
pip install -r requirements.txt
