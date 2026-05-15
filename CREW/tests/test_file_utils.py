# No sys.path modification needed; use direct imports for local modules
import pandas as pd
import sys
import os

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))
import file_utils


def test_read_file(tmp_path):
    def test_read_file_not_found():
        result = file_utils.read_file("nonexistent.txt")
        assert result is None

    def test_read_file_permission_error(tmp_path):
        file_path = tmp_path / "no_permission.txt"
        file_path.write_text("data")
        file_path.chmod(0o000)
        try:
            result = file_utils.read_file(str(file_path))
            assert result is None
        finally:
            file_path.chmod(0o644)

    file_path = tmp_path / "test.txt"
    file_path.write_text("hello world")
    result = file_utils.read_file(str(file_path))
    assert result == "hello world"


def test_read_csv_builtin(tmp_path):
    def test_read_csv_builtin_file_not_found():
        result = file_utils.read_csv_builtin("nonexistent.csv")
        assert result == []

    def test_read_csv_builtin_malformed(tmp_path):
        csv_path = tmp_path / "bad.csv"
        csv_path.write_text("a,b\n1\n2,3,4\n")
        # Should not raise, just parse as rows
        result = file_utils.read_csv_builtin(str(csv_path))
        assert isinstance(result, list)

    csv_path = tmp_path / "test.csv"
    csv_path.write_text("a,b\n1,2\n3,4\n")
    result = file_utils.read_csv_builtin(str(csv_path))
    assert result == [["a", "b"], ["1", "2"], ["3", "4"]]


def test_read_csv_pandas(tmp_path):
    def test_read_csv_pandas_file_not_found():
        result = file_utils.read_csv_pandas("nonexistent.csv")
        assert result is None

    csv_path = tmp_path / "test.csv"
    csv_path.write_text("a,b\n1,2\n3,4\n")
    df = file_utils.read_csv_pandas(str(csv_path))
    assert isinstance(df, pd.DataFrame)
    assert list(df.columns) == ["a", "b"]
    assert df.shape == (2, 2)


def test_read_excel(tmp_path):
    def test_read_excel_file_not_found():
        result = file_utils.read_excel("nonexistent.xlsx")
        assert result is None

    # Requires openpyxl installed
    excel_path = tmp_path / "test.xlsx"
    df = pd.DataFrame({"a": [1, 2], "b": [3, 4]})
    df.to_excel(excel_path, index=False)
    result = file_utils.read_excel(str(excel_path))
    # Accept either DataFrame or dict of DataFrames (for multiple sheets)
    if isinstance(result, dict):
        # If dict, check first sheet
        df = list(result.values())[0]
        assert isinstance(df, pd.DataFrame)
        assert list(df.columns) == ["a", "b"]
    else:
        assert isinstance(result, pd.DataFrame)
        assert list(result.columns) == ["a", "b"]
