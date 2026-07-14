import pyodbc

SERVER = "LAPTOP-IG8U9IFK\\SQLEXPRESS02"
DATABASE = "InvestmentPortfolioAnalytics"

def get_connection():
    conn = pyodbc.connect(
        f"""
        DRIVER={{ODBC Driver 17 for SQL Server}};
        SERVER={SERVER};
        DATABASE={DATABASE};
        Trusted_Connection=yes;
        """
    )
    return conn